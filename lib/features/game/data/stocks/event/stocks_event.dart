import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/features/game/data/stocks/status/stocks_status.dart';

part 'stocks_event.g.dart';

@HiveType(typeId: 1)
class StocksEvent {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final StocksStatus status;

  StocksEvent({
    required this.title,
    required this.description,
    required this.status,
  });

  static final List<StocksEvent> stocksEventList = [
    StocksEvent(
      title: 'Successful launch of a new product or service',
      description:
          'For example, the launch of a new smartphone, tablet, application, or online platform can increase investor interest in the company\'s stocks.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Securing major contracts or agreements:',
      description:
          'Signing major contracts for the supply of technological equipment or services with large corporations or government organizations can boost stock prices.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Positive financial results:',
      description:
          'Publishing positive financial reports, including revenue growth, profits, and growth indicators, can strengthen investor confidence and support stock prices.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Technological innovations and breakthroughs:',
      description:
          'Announcement of new technologies, technological breakthroughs, or patents can push the company\'s stocks higher.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Strategic mergers and acquisitions',
      description:
          'Participation in strategic mergers and acquisitions that strengthen the company\'s market positions or expand its portfolio of products and services can attract investor interest.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Growth in user base or activity:',
      description:
          'Significant growth in the number of users or activity on the platform (such as an increase in active users, time spent on the site, or app downloads) can positively impact stocks.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Credit rating upgrade: ',
      description:
          'Upgrading the company\'s credit rating or changing the outlook to "positive" from credit rating agencies can increase investor confidence and support stock prices.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Development of new technological solutions:',
      description:
          'Announcement of the development of new technologies that can significantly change the industry or create new market opportunities can attract investor attention.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Participation in major events and exhibitions:',
      description:
          'Participation in major technology exhibitions or events where the company showcases its products and technologies can attract investors and partners.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Stable leadership and development strategy:',
      description:
          'Confirmation of stable company leadership and announcement of a clear development strategy for the future can strengthen investor confidence and support stock prices.',
      status: StocksStatus.up,
    ),
    StocksEvent(
      title: 'Product recalls or failures:',
      description:
          'Instances of product recalls due to defects or failures can lead to a loss of investor confidence and a decline in stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Data breaches or security concerns: ',
      description:
          'Major data breaches or security vulnerabilities in technology products or services can damage a company\'s reputation and result in a sell-off of its stocks.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Regulatory scrutiny or legal challenges:',
      description:
          'Increased regulatory scrutiny or legal challenges related to antitrust, privacy, or intellectual property issues can create uncertainty and negatively affect stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Poor financial performance:',
      description:
          'Declining revenues, profits, or growth prospects can lead to investor disappointment and a decrease in the valuation of technology companies.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Leadership scandals or controversies:',
      description:
          'Scandals or controversies involving company executives or key personnel can erode investor trust and have a detrimental impact on stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Competitive pressures:',
      description:
          'Intense competition from other technology companies, especially if they introduce innovative products or services, can lead to market share loss and a decline in stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Macroeconomic factors:',
      description:
          'Economic downturns, recessions, or geopolitical tensions can weaken consumer spending and corporate investment, negatively impacting technology companies\' earnings and stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Technological obsolescence:',
      description:
          'Rapid technological advancements or shifts in consumer preferences can render existing products or services obsolete, leading to a decline in demand and stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Supply chain disruptions:',
      description:
          'Disruptions in the supply chain due to natural disasters, trade disputes, or geopolitical conflicts can disrupt production and distribution, affecting technology companies\' ability to meet market demand and impacting stock prices.',
      status: StocksStatus.down,
    ),
    StocksEvent(
      title: 'Negative press or public perception:',
      description:
          'Negative media coverage, social media backlash, or public relations crises can tarnish a company\'s brand image and lead to a decrease in investor confidence, resulting in a drop in stock prices.',
      status: StocksStatus.down,
    ),
  ];
}
